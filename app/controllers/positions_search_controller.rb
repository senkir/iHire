class PositionsSearchController < ApplicationController
  def index
    @title = "Open Position Search Controller"
    @query = params[:position]
  end

  def results
    @positions = Position.all
    
  end

  def detail
  end

  def search
  end
end

=begin
<% form.inputs :name => "Basic Search", :for => :position do |f| %>
  <% f.inputs do %>
    <%= f.input :title %>
    <%= f.input :location, :collection => Position.find(:all, :select => "DISTINCT(location)").map(&:location) %>
    <%= f.input :department, :collection => Position.find(:all, :select => "DISTINCT(department)").map(&:department) %>
  <% end %>
  <%= f.commit_button %>
=end