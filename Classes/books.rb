class Book
    def initialize(name, status)
        @name = name
        @status = status
    end
    
    def toggle
        if @status == "in" #use @status because we are modifying an instance variable
            @status = "out"
        else
            @status = "in"
        end
        self #returns the object itself, not just the revised status value
    end

    def name #returns the book name
        @name
    end

    def status
        @status
    end

    def self.from_string(string) #this is a class method not an object method, so it requires an object. 'Self' refers to the class itself
        name, status = string.split(";") #split returns an array, left hand assigns the items in it, equivalent to typing name = array[0] etc etc etc
        Book.new(name, status) #creates the new object
    end
end

all_books = [
    Book.from_string('The Martian;in'),
    Book.from_string('The Hobbit;out'),
    Book.from_string('The Universe in a Nutshell;in')
]

all_books.each do |book| #prints the name of each book
    pp book.name
end

available_books = all_books.filter do |book|
    book.status == "in"
end

pp available_books