# frozen_string_literal: true

class WebLog
  def initialize(page, ips: [])
    @page = page
    @ips = ips
    @views = ips.size
    @unique_views = 0
  end

  def add(ip)
    @ips.push ip
    @views += 1
  end

  def refresh_unique_views_counter
    @unique_views = ips.uniq.size
  end

  attr_reader :ips, :views, :page, :unique_views
end
