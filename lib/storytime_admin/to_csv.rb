module StorytimeAdmin
  module ToCsv
    extend ActiveSupport::Concern

    module ClassMethods
      def csv_columns
        column_names
      end

      def to_csv
        CSV.generate(headers: true) do |csv|
          csv << self.csv_columns
          all.each do |record|
            csv << attributes.map{ |attr| record.send(attr) }
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, StorytimeAdmin::ToCsv