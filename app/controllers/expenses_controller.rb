class ExpensesController < ApplicationController
  def index

  	params.each do |key,value|
		puts "Param #{key}: #{value}"
	end


	concept = params[:concept]

	category_id = params[:category_id]

	if !concept.blank? && !category_id.blank?
    	@expenses = Expense.order("date DESC").where("concept LIKE ? AND category_id=?", "%#{concept}%", category_id)
    elsif concept.blank? && category_id.blank?
		@expenses = Expense.order("date DESC")
	elsif category_id.blank?
		@expenses = Expense.order("date DESC").where("concept LIKE ?", "%#{concept}%")
	else
    	@expenses = Expense.order("date DESC").where("category_id=?", category_id)
    end

  end
end
