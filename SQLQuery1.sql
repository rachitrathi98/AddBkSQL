/*UC1: Creating Address Book Database*/
create database AddressBookService;
use AddressBookService;

/* UC2: Create AddressBook Table */
create table AddressBook(
Id int IDENTITY (1,1),
FirstName varchar(50),
LastName varchar(50),
Address varchar(50),
City varchar(50),
State varchar(50),
Zip int,
PhoneNumber varchar(50),
Email varchar(50)
);

/*UC3: Insert new contact in the AddressBook Table*/
insert into AddressBook values
('Rachit','Rathi','Mumbai','Juhu','Maharashtra',400054,'123456789','rachit@gmail.com'),
('Tanmay','Maity','Kolkatta','Howrah','Bengal',600080,'0123456789','tanmay@gmail.com'),
('Parth','Trivedi','Rajkot','Jaamnagar','Gujarat',800080,'1023456789','parth@gmail.com'),
('Pranav','Jaguste','New Delhi','Gurgaon','Delhi',400080,'1203456789','pranav@gmail.com'),
('Yash','Patil','Mumbai','Goregaon','Maharashtra',800080,'1234506789','yash@gmail.com');

/*UC4: Edit exiting contact using person name*/
update AddressBook set City='Thane', Zip=400604 where FirstName='Parth' and LastName='Trivedi';

/*UC5: Delete exiting contact using person name*/
delete from AddressBook where FirstName='Parth' and LastName='Trivedi';

/* UC6: Retrieve person belonging to city or state*/
select * from AddressBook where city='Juhu' or state='Maharashtra';

/* UC7: Get size of Addressbook by city or state */
select count(city) as TotalContacts from AddressBook;

/* UC8: Retrieve person entry sorted alphabetically */
select * from AddressBook where Address='Mumbai' order by FirstName;

/* UC9: Alter Table to Add BookName and it's Type */
alter table AddressBook add BookName varchar(50), BookType varchar(50);
update AddressBook set BookName='Book1', BookType='Family' where LastName='Rathi'; 
update AddressBook set BookName='Book2', BookType='Friends' where FirstName='Tanmay' or FirstName='Yash';

/* UC10: Count person by type */
select BookType, count(BookType) as CountType from AddressBook group by BookType;

/* UC11: Add a person to both family and friend type */
insert into AddressBook values
('Mohit','Rathi','Mumbai','Thane','Maharashtra',400604,'2013456789','mohit@gmail.com','Book1','Family'),
('Akhil','Rathi','Mumbai','Thane','Maharashtra',400604,'2013456789','akhil@gmail.com','Book2','Friends');

select * from AddressBook;