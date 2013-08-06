require "rspec"

require_relative "list"

describe List do
  
  let(:title) { "To Catch A Predator Watch List" }
  let(:tasks) { ["Creepy dude from Jersey Shore who wears too much cologne", "Santa Claus", "Weird guy who lingers at internet cafe"] }
  let(:list)  { List.new(title, tasks) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a list instance with a title and tasks" do
        #Deprecated syntax, keeping for reference
        #List.new("Candy", ["Kit-Kat", "Twizzlers", "Dark Chocolate With Sea Salt"]).should be_an_instance_of List
        expect(List.new("Candy", ["Kit-Kat", "Twizzlers", "Dark Chocolate With Sea Salt"])).to be_an_instance_of(List)
      end
    end

    context "with invalid input" do
      it "will not successfully create a list without a title" do
        expect { List.new }.to raise_error(ArgumentError)
      end

      it "will not successfully create a list with more than two arguments" do
        expect { List.new("OVOXOXO", ["YOLO", "HYFR", "Champagne Papi" ], "Drake") }.to raise_error(ArgumentError)
      end

      it "will not successfully create a list without the second argument as an array" do
        expect { List.new("Title", "Tasks")  }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#add_task" do
  end

  describe "#complete_task" do
  end

  describe "#delete_task" do
  end

  describe "#completed_tasks" do
  end

  describe "#incomplete_tasks" do
  end

end


  # def initialize(title, tasks = [])
  #   @title = title
  #   @tasks = tasks
  # end

  # def add_task(task)
  #   tasks << task
  # end

  # def complete_task(index)
  #   tasks[index].complete!
  # end

  # def delete_task(index)
  #   tasks.delete_at(index)
  # end

  # def completed_tasks
  #   tasks.select { |task| task.complete? }
  # end

  # def incomplete_tasks
  #   tasks.select { |task| !task.complete? }
  # end
