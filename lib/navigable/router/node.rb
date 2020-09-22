# frozen_string_literal: true

module Navigable
  class Router
    class Node
      MUSTERMANN_VERSION = '5.0'
      DYNAMIC_PREFIX = /:/.freeze

      attr_reader :endpoint

      def initialize
        @endpoint = nil
        @static = nil
        @dynamic = nil
      end

      def add(segment)
        dynamic?(segment) ? add_dynamic(segment) : add_static(segment)
      end

      def find(segment)
        find_node(segment) { |params| yield(symbolize_keys(params)) if params && block_given? }
      end

      def attach(endpoint)
        @endpoint = endpoint
      end

      private

      def add_static(segment)
        @static ||= {}
        @static[segment] ||= self.class.new
      end

      def add_dynamic(segment)
        @dynamic ||= {}
        @dynamic[dynamic_segment(segment)] ||= self.class.new
      end

      def find_node(segment, &block)
        return if empty?

        find_static(segment, &block) || find_dynamic(segment, &block)
      end

      def find_static(segment, &block)
        @static ||= {}
        @static[segment].tap { |node| node && block.call({}) }
      end

      def find_dynamic(segment, &block)
        @dynamic ||= {}
        matcher = @dynamic.keys.find { |matcher| block.call(matcher.match(segment)&.named_captures) }
        matcher && @dynamic[matcher]
      end

      def empty?
        !@static && !@dynamic
      end

      def dynamic?(segment)
        DYNAMIC_PREFIX.match?(segment)
      end

      def dynamic_segment(segment)
        Mustermann.new(segment, type: :rails, version: MUSTERMANN_VERSION)
      end

      def symbolize_keys(hash)
        hash.each_with_object({}) { |(key, value), obj| obj[key.to_sym] = value }
      end
    end
  end
end