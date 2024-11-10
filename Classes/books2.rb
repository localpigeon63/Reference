#refactored using accessors
# can set reader, writer, or accessor (which can both read and write)

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

    attr_reader :status
    attr_reader :name
    #each of these is a class method, taking a symbol. The symbol becomes the method name (see use in two blocks below e.g. pp book.name)

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