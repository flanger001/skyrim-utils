# frozen_string_literal: true

module SkyrimUtils
  class Database
    attr_reader :backend, :base_path

    def initialize(base_path)
      @backend = []
      Dir.children(base_path).each do |filename|
        save = Save.from(base_path, filename)
        next if save.nil?
        @backend.push(save)
      end
      @base_path = base_path
    end
  end
end
