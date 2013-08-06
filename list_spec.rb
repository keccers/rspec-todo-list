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
    it "will add a task to the list's task array, increasing the array length by 1" do
      task1 = double("Gym teacher at the elementary school")
      expect { list.add_task(task1) }.to change { list.tasks.length }.by(1)
    end
  end

  describe "#complete_task" do
    it "will call the complete method on the task from the task list with the given index" do
      task1 = double("A unicorn named Kevin")
      task2 = double("A chimera named Karst")
      task3 = double("A chupacabra named Katherine")

      allow(task1).to receive(:complete!)
      allow(task2).to receive(:complete!)
      allow(task3).to receive(:complete!)

      list = List.new("Cool", [task1, task2, task3])

      task1.should_receive(:complete!).once
      list.complete_task(0)
    end
  end

  describe "#delete_task" do
    it "will remove a task from the list's task array, decreasing the array length by 1" do
      expect { list.delete_task(0) }.to change { list.tasks.length }.by(-1)
    end

    it "will not delete a task if given an invalid index" do
      expect { list.delete_task(10) }.not_to change { list.tasks.length }
    end
  end

  describe "#completed_tasks" do
    it "will return an array of completed tasks" do
      task1 = double("Creepy dude from Jersey Shore who wears too much cologne")
      task2 = double("Santa Claus")
      task3 = double("Weird guy who lingers at internet cafe")

      allow(task1).to receive(:complete?).and_return(true)
      allow(task2).to receive(:complete?).and_return(true)
      allow(task3).to receive(:complete?).and_return(false)

      list = List.new("To Catch A Predator Watch List", [task1, task2, task3])

      expect(list.completed_tasks).to be_a(Array)
      expect(list.completed_tasks.length).to eql(2)
    end
  end

  describe "#incomplete_tasks" do
    it "will return an array of incompleted tasks" do
      task1 = double("Creepy dude from Jersey Shore who wears too much cologne")
      task2 = double("Santa Claus")
      task3 = double("Weird guy who lingers at internet cafe")

      allow(task1).to receive(:complete?).and_return(true)
      allow(task2).to receive(:complete?).and_return(true)
      allow(task3).to receive(:complete?).and_return(false)

      list = List.new("To Catch A Predator Watch List", [task1, task2, task3])

      expect(list.incomplete_tasks).to be_a(Array)
      expect(list.incomplete_tasks.length).to eql(1)
    end
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
