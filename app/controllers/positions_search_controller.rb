class PositionsSearchController < ApplicationController
  def index
    @page_title = "Open Position Search Controller"
    #if a search has occured, save it as a local variable
    @query = params[:position]
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