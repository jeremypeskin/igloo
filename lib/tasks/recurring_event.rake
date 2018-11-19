  namespace :db do

  desc 'This task creates invoices and expenses based on recurring events'
  task :recurring_event => :environment do
    Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
    if Date.today == Date.today.at_beginning_of_month + 17
      RecurringEvent.all.each do |event|
        if event.category == "Invoice"
          Invoice.create(user_id:event.user.id, amount:event.try(:amount), description:event.try(:description), unit_id:event.try(:unit_id))
          puts 'Invoice created'
        elsif event.category == "Expense"
          Expense.create(user_id:event.user.id, amount:event.try(:amount), description:event.try(:description), unit_id:event.try(:unit_id))
          puts 'Expense created'
        end
      end
    else
      puts Time.now.day
    end
  end

end
