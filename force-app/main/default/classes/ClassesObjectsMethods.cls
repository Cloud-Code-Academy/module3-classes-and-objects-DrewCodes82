/**
 * The ClassesObjectsMethods class serves as an exploration into Object Oriented Programming in Apex.
 * It covers fundamental aspects such as class instantiation, method creation, encapsulation, and object interaction.
 *
 * This class introduces developers to the concept of creating and manipulating objects in Apex. It discusses
 * how to define classes, create methods, and use objects. This class uses two example classes - Person and Book.
 * 
 * Topics covered in this class include:
 * - Understanding how to define a class in Apex.
 * - Understanding how to create methods in Apex.
 * - Understanding how to instantiate objects of a class.
 * - Understanding encapsulation and the importance of getter and setter methods.
 *
 * Users of this class can expect to gain a strong understanding of Object Oriented Programming in Apex and
 * be prepared for more advanced topics in Salesforce development.
 * 
 * The Person class is a simple representation of a person with properties like name and age, and a method
 * that allows the person to introduce themselves.
 * 
 * The Book class is a simple representation of a book with properties like title and author, and methods
 * to read and close the book.
 * 
 * Resources:
 * String class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm
 * Date class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm
 * Math class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_math.htm
 * Classes: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_understanding.htm
 *
 * @author Drew Howard
 */

public with sharing class ClassesObjectsMethods {

    /**
     * Question 1
     * It initializes a String to "Hello, Salesforce!" and demonstrates usage of
     * the length, substring, and toLowerCase methods of the String class.
     * Example: practiceStringMethods() should return a list like ["17", "Hello", "hello, salesforce!"].
     * @return A list containing the length of the string, a substring of the string, and the string in lower case.
     */
    public static List<String> practiceStringMethods() {
        // Initialize a String with 'Hello, Salesforce!'
        String str1 = 'Hello, Salesforce!';
        
        // Get the length of the String  
        String str1Length = String.valueOf(str1.length());      
        // Get a substring of the String of the first 5 characters
        String str1Substring = str1.substring(0,5);
        // Convert the String to lower case
        String str1LowerCase = str1.toLowerCase();
        
        // Return the list with the string data
        List<String> strList = new List<String>{str1Length, str1Substring, str1LowerCase};
        // In the first position add the string length
        // In the second position add the substring
        // In the third position add the string in lower case

        return strList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 2
     * Check if the input string starts with 'Sales', ends with 'Force', and contains 'Awesome'.
     * Example: checkStringContent('Salesforce is Awesome!') should return a list like [true, false, true].
     * @param input The input string.
     * @return A list of boolean values indicating whether the string starts with 'Sales', ends with 'Force', or contains 'Awesome'.
     */
    public static List<Boolean> checkStringContent(String input) {
        // Initialize a list to store the results
        List<Boolean> results = new List<Boolean>();
        
        // Check if the string starts with 'Sales'
        Boolean startsWithSales = input.startsWith('Sales');
        results.add(startsWithSales);
        // Check if the string ends with 'Force'
        Boolean endsWithForce = input.endsWith('Force');
        results.add(endsWithForce);
        // Check if the string contains 'Awesome'
        Boolean containsAwesome = input.contains('Awesome');
        results.add(containsAwesome);
        return results; // Replace null with the variable you used to store the result
    }

    /**
     * Question 3
     * Take a sentence then remove any duplicate words, and return the sentence with only unique words.
     * Example: removeDuplicateWords('Hello Hello Salesforce Salesforce') should return 'Hello Salesforce'.
     * @param sentence The input sentence.
     * @return A string consisting of only unique words from the input sentence.
     */
    public static String removeDuplicateWords(String sentence) {
        // Split the sentence into words
        List<String> words = sentence.split(' ');
        // Create a set to store the unique words
        /* COMMENT added for Riley/Code Reviewer to see original implementation:
        Set<String> deDupWords = new Set<String>();
        for (String word : words){
            deDupWords.add(word);
        }
        String newSentence = deDupWords.toString();
        return newSentence; 
        this produced a String with the following format: {Salesforce, is}.
        I used GPT to help troubleshoot, finding the join method:
        String newSentence = String.join(new List<String>(deDupWords), ' ');
        but it made me aware that the order of words isn't always guaranteed with Sets and it provided 
        a chance to refactor and ensure that the order of the words was maintained by checking if the
        word already exists in the Set, and if it doesn't adding it to both a new List of Unique words to 
        maintain the correct order, and the Set, to deduplicate and skip adding to the list if it already exists */
        Set<String> seenWords = new Set<String>();
        List<String> uniqueWords = new List<String>();
        // Add each word to the set
        for (String word : words){
            if(!seenwords.contains(word)){
                uniqueWords.add(word);
                seenWords.add(word);
            }
            
        }
        // Join the unique words back into a sentence
        
        // Return the sentence with unique words
        return String.join(uniqueWords, ' '); // Replace null with the variable you used to store the result
    }

    /**
     * Question 4
     * This method takes a string as a parameter, and calculates the number of vowels in the string.
     * For simplicity, we will consider only five vowels: 'a', 'e', 'i', 'o', 'u', and we will ignore case.
     * Example: countVowels("Hello World!") should return 3
     * @param s The string in which to count vowels.
     * @return The number of vowels in the string.
     */
    public static Integer countVowels(String str) {
        // Initialize the result Integer
        Integer vowelCounter = 0;
        List<String> vowels = new List<String>{'a','e','i','o','u'};
        /*
        for () {
            // get individual characters from the string - hint use substring or split
            // check if the character is a vowel
            // if it is a vowel, increment the result Integer
        }
        */
        List<String> letters = str.split('');
        for (String letter : letters){
            vowelCounter += letter.countMatches(vowels[0])
            + letter.countMatches(vowels[1])
            + letter.countMatches(vowels[2])
            + letter.countMatches(vowels[3])
            + letter.countMatches(vowels[4]);
        }

        return vowelCounter; // Replace null with the variable you used to store the result
    }

    /**
     * Question 5
     * Given a list of scientist names, combine their names together with a comma if it contains the letter 'g'.
     * The final string should not end with a comma.
     * Example: findTheScientist() should return "Alan Turing,Grace Hopper,Guido van Rossum,Stephen Hawking"
     * @return A string containing the names of scientists that contain the letter 'g'.
     */
    public static String findTheScientist() {
        // The list of scientists' names
        List<String> scientistNames = new List<String>{'Tim Berners-Lee', 'Alan Turing', 'Grace Hopper', 'Donald Knuth', 'Guido van Rossum', 'Ken Thompson', 'Stephen Hawking'};

        // The variable to store the concatenated string
        List<String> matches = new List<String>();
        
        // Loop through the list of scientists' names
        for (String name : scientistNames){
            // If the name doesn't contain the letter 'G', skip this iteration
            if (name.toLowerCase().contains('g')){
                // Add the name to the result string, followed by a comma
                matches.add(name);
            } 

        }
        // Remove the last comma from the result string
        return String.join(matches, ','); // Replace null with the variable you used to store the result
    }

    /**
     * Question 6
     * This method calculates the absolute value of the difference between of two input numbers that are raised to the 2nd power.
     * Example: calculateDifferenceOfSquares(3, 4) should return 7.
     * @param a The first number.
     * @param b The second number.
     * @return The absolute value of the difference
     */
    public static Double calculateDifferenceOfSquares(Double a, Double b) {
        // Square the input numbers using the Math.pow() function
        Double exponent = 2;
        a = Math.pow(a, exponent);
        b = Math.pow(b, exponent);

        // Calculate the absolute difference using Math.abs() function
        Double difference = Math.abs(a - b);

        // Return the result
        return difference; // Replace null with the variable you used to store the result
        
    }

    /**
     * Question 7
     * Generate a random number between 50 and 100
     * Example: generateRandomNumber() should return a number like 75.
     * @return A integer between 50 and 100.
     */
    public static Integer generateRandomNumber() {
        // Use Math class to generate number between 50 and 100
        Integer randomNumber = Integer.valueOf(Math.random() * 50) + 50;
        // Return the random integer
        return randomNumber; // Replace null with the variable you used to store the result        
    }

    /**
     * Question 8
     * Format the current date in the current user locale format.
     * Example: getCurrentDate() should return a string like "3/21/2001" for US locale users. Locale/String may differ depending on your location.
     * @return The current date in the current user locale format.
     */
    public static String getCurrentDate() {
        // Get the todays date
        Date currentDate = Date.today();
        // Format the current date
        String dateString = currentDate.format();
        // Return the result
        return dateString; // Replace null with the variable you used to store the result
    }

    /**
     * Question 9
     * Given a date time return the day of the week in number format
     * @param dt the current date and time
     * @return The number of the day of the week for the given date.
     */
    public static String getDayOfWeek(DateTime dt) {
        // Define a map of day of the week as a key and day number as the value
        // Monday = 1, Tuesday = 2, etc.
        Map<String, Integer> daysOfTheWeek = new Map<String, Integer>{
            'Monday' => 1,
            'Tuesday' => 2,
            'Wednesday' => 3, 
            'Thursday' => 4,
            'Friday' => 5,
            'Saturday' => 6,
            'Sunday' => 7
        };

        // Get the day name using .format('EEEE');
        String dayOfTheWeek = dt.format('EEEE');
        // Get the day number from the map using the day name
        String dayNumber = String.valueOf(daysOfTheWeek.get(dayOfTheWeek));
        // Return the result as a string
        return dayNumber; // Replace null with the variable you used to store the result
    }


    /**
     * Question 10
     * Calculate the difference between the years of two dates
     * For example, if the first date is 2023-01-01 and the second date is 2025-12-31, the method should return 2
     * If either of the dates is null, return null.
     * @param d1 The first date.
     * @param d2 The second date.
     * @return The a positive number years between the two dates, or null if either date is null.
     */
    public static Integer calculateYearDifference(Date d1, Date d2) {
        Integer result = 0;
        
        if(d1 == null || d2 == null){
            return null;
        } else {
            // Subtract the difference in years
            result = math.abs(d1.year() - d2.year());
        }  
        return result; // Replace null with the variable you used to store the result
    }

    /**
     * Question 11
     * The Book class represents a book in a library. 
     * Each Book object has a title and an author, and methods to return these details.
     * This class can be used in the context of a library management system, bookstore, etc.
     * where you need to manipulate and manage book information.
     */
    public class Book {
        // Declare three public instance variables - title, author, pages
        // title
        public String title;
        // author
        public String author;
        // pages
        public Integer pages;
    
        // Book constructor to initialize the title and author
        public Book(String title, String author) {
            // Initialize the title and author
            this.title = title;
            this.author = author;
        }
    
        // Method that returns the details of the book
        public String getBookDetails() {
            // return A string containing the details of the book in the format "Title: <title>, Author: <author>"
            String titleAndAuthor = 'Title: ' + title + ', Author: ' + author;
            return titleAndAuthor; // Replace null with the variable you used to store the result
        }
    }
    

    /**
     * Question 12
     * Create a Book object and returns the details of the book.
     * For example, createAndGetBookDetails() should return a string like "Title: A Brief History of Time, Author: Stephen Hawking".
     * @return A string containing the details of the book.
     */
    public static String createAndGetBookDetails() {
        // Create a Book object with title "A Brief History of Time" and author "Stephen Hawking"
        Book newBook = new Book('A Brief History of Time', 'Stephen Hawking');
        // Call the getBookDetails method on the book object to get the details of the book
        String newBookDetails = newBook.getBookDetails();
        // Return the details of the book
        return newBookDetails; // Replace null with the variable you used to store the result
    }

    /**
     * Question 13
     * Create and update two Book objects and returns the books.
     * For example, generateBookList(Book) should return a list like ["Title: Harry Potter and the Chamber of Secrets, Author: J.K. Rowling", "Title: A Brief History of Time, Author: Stephen Hawking"].
     * Update Book 1 values: title = "Harry Potter and the Chamber of Secrets", author = "J.K. Rowling", pages = 352
     * Book 2 values: title = "A Brief History of Time", author = "Stephen Hawking"
     * @param myBook1 The first book object.
     * @return return a list of books.
     */
    public static List<Book> generateBookList(Book myBook1) {
        // Create a list of books
        List<Book> bookList = new List<Book>();
        
        bookList.add(myBook1);

        // Update the title and author of myBook1
        myBook1.title = 'Harry Potter and the Chamber of Secrets';
        myBook1.author = 'J.K. Rowling';
        // Update the pages for myBook1 to 352
        myBook1.pages = 352;

        // Create a new Book object with title "A Brief History of Time" and author "Stephen Hawking"
        Book myBook2 = new Book('A Brief History of Time', 'Stephen Hawking');

        // Update the pages for A Brief History of Time to 256
        myBook2.pages = 256;
        // Add the book to the list
        bookList.add(myBook2);

        return bookList; // Replace null with the variable you used to store the result      
    }


    /**
     * Question 14
     * The Person class represents a person.
     * Each Person object has a name and an age, and methods to return these details.
     * This class can be used in the context of a school, college, etc.
     * where you need to manipulate and manage person information.
     */
    public class Person {
        // Declare private two instance variables - (TEXT) name and (Number) age
        private String name;
        private Integer age;        
        // Constructor to initialize the name and age
        public Person(String name, Integer age){
            this.name = name;
            this.age = age;
        }
    
        // Method introduceYourself that returns the details of the person
        public String introduceYourself(){
            return 'Hello, my name is ' + name + ' and I am ' + age + ' years old.';
        }        
        // Return a string in the format "Hello, my name is <name> and I am <age> years old."
        // For example, introduceYourself() should return a string like "Hello, my name is John Doe and I am 28 years old."

        // Getter method that returns the name of the person
        public String getName(){
            return name;
        }

        // Getter method that returns the age of the person
        public Integer getAge(){
            return age;
        }

        // Setter method that sets the name of the person
        public void setName(String newName){
            this.name = newName;
        }

        // Setter method that sets the age of the person
        public void setAge(Integer newAge){
            this.age = newAge;
        }
    }

    /**
     * Question 15
     * Create a Person object and returns the details of the person.
     * For example, personDetails() should return a list like ["Hello, my name is John Doe and I am 28 years old.", "John Doe", "28"].
     * @return A string containing the details of the person.
     */

    public static List<String> personDetails() {
        List<String> results = new List<String>();
        // Create a new instance of Person class
        // Name the person 'John Doe' and set the age to 28
        Person newPerson = new Person('John Doe', 28);
        
        // Add the details of the person using the introduceYourself method
        results.add(newPerson.introduceYourself());
        // Get the name of the person using the getter method and add it to the list
        results.add(newPerson.getName());

        // Get the age of the person using the getter method and add it to the list
        results.add(String.valueOf(newPerson.getAge()));

        return results; // Replace null with the variable you used to store the result
    }

    /**
     * Question 16
     * Create a Person object with the provided name and age.
     * @param name The name of the person.
     * @param age The age of the person.
     * @return A new instance of the Person class.
     */
    public static Person createPerson(String name, Integer age) {
        // Create a new instance of the Person class using the provided name and age
        Person newPerson = new Person(name, age);
        // Return the new instance of the Person class
        return newPerson; // Replace null with the variable you used to store the result
    }

    /**
     * Question 17
     * Create a method that constructs multiple Person objects.
     * You are to create a new Person object for each name in the provided List<String> of names,
     * using the same age for all Person objects. The method should return a List<Person> of all the Person objects created. 
     * @param names A list of names.
     * @param age The age to be set for all the Person objects.
     * @return A list of new Person objects.
     */
    public static List<Person> createMultiplePersons(List<String> names, Integer age) {
        List<Person> people = new List<Person>();
        // Loop through each name in the provided list of names
        for(String name : names){
            // Create a new Person object for each name
            Person p = new Person(name, age);
            // Add the new Person object to the list of Person objects
            people.add(p);

        }
            
        // Return the list of Person objects
        return people; // Replace null with the variable you used to store the result
    }


    /**
     * Question 18
     * Compare two Person objects based on their ages.
     * If the first Person is older, the method should return the first Person. If the second Person is older, it should return the second Person.
     * If they are the same age, return either.
     *
     * @param person1 The first Person object.
     * @param person2 The second Person object.
     * @return The Person object of the older person.
     */
    public static Person getOlderPerson(Person person1, Person person2) {
        if(person1.age > person2.age){
            return person1;
        } 
        return person2;
        // Replace null with the variable you used to store the result
    }
}