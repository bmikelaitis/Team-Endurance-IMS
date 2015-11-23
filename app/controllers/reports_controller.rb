class ReportsController < ApplicationController
      require 'csv'
    def index
        @receipts = Receipt.all
        respond_to do |format|
        format.html
        format.csv do
            headers['Content-Disposition'] = "attachment; filename=\"receipt-list\""
            headers['Content-Type'] ||= 'text/csv'
        end
     end
    end
    
    
    
end