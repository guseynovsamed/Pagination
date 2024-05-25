

create database Course


use Course


create table Countries(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(70)
)



create table Cities(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [CountryId] int,
    foreign key (CountryId) references Countries(Id)
)


select * from Cities


create table Studients (
    [Id] int primary key identity(1,1),
    [FullName] nvarchar(100),
    [Age] int ,
    [Email] nvarchar(100),
    [CityId] int ,
    foreign key (CityId) references Cities(Id) 
)


create table Teachers(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [Salary] float,
    [CityId] int ,
    foreign key (CityId) references Cities(Id) 
)

create table Rooms(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [Capacity] int
)


create table StaffMembers(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [Age] int,
    [Address] nvarchar(50),
    [Salary] float ,
    [RoomId] int 
    foreign key (RoomId) references Rooms(Id) 
)


create table Groups(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(60),
    [RoomId] int 
    foreign key (RoomId) references Rooms(Id) 
)

create table StudentsGroups(
    [Id] int primary key identity(1,1),
    [StudentId] int,
    [GroupId] int
    foreign key (StudentId) references Studients(Id),
    foreign key (GroupId) references Groups(Id) 
)


create table TeacherGroups(
    [Id] int primary key identity(1,1),
    [TeacherId] int,
    [GroupId] int
    foreign key (TeacherId) references Teachers(Id),
    foreign key (GroupId) references Groups(Id) 
)


create table Roles(
    [Id] int primary key identity(1,1),
    [Specialist] nvarchar(50),
    [StaffMembersId] int 
    foreign key (StaffMembersId) references StaffMembers(Id) 
)


drop table Roles


