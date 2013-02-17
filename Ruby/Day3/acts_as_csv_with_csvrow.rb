# coding: utf-8

module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    include Enumerable

    class CsvRow
      def initialize headers, row
        @headers = headers
        @row = row
      end

      def method_missing name, *args
        @row[@headers.index(name.to_s)]
      end

      attr_accessor :headers, :row
    end

    def read
      @csv_contents = []
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    attr_accessor :headers, :csv_contents

    def each
      @csv_contents.each do |content|
        yield content
      end
    end

    def initialize
      read
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each {|row| puts row.id}
m.each {|row| puts row.value}

