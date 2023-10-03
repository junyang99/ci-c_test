-- Drop HR Portal database if it exists
DROP DATABASE IF EXISTS `HR Portal`;

-- Create the HR Portal database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `HR Portal`;

-- Use the HR Portal database
USE `HR Portal`;

-- Create the Role table
CREATE TABLE IF NOT EXISTS Role (
    Role_Name VARCHAR(20) PRIMARY KEY,
    Role_Desc TEXT
);
INSERT INTO Role (Role_Name, Role_Desc)
VALUES
("Account Manager", "The Account Manager acts as a key point of contact between an organisation and its clients. He/She possesses thorough product knowledge and oversees product and/or service sales. He works with customers to identify their wants and prepares reports by collecting, analysing, and summarising sales information. He contacts existing customers to discuss and give recommendations on how specific products or services can meet their needs. He maintains customer relationships to strategically place new products and drive sales for long-term growth. He works in a fast-paced and dynamic environment, and travels frequently to clients' premises for meetings. He is familiar with client relationship management and sales tools. He is knowledgeable of the organisation's products and services, as well as trends, developments, and challenges of the industry domain. The Sales Account Manager is a resourceful, people-focused, and persistent individual, who takes rejection as a personal challenge to succeed when given opportunity. He appreciates the value of long-lasting relationships and prioritises efforts to build trust with existing and potential customers. He exhibits good listening skills and is able to establish rapport with customers and team members alike easily."),
("Admin Executive", "Admin Executive will act as the point of contact for all employees, providing administrative support and managing their queries. Main duties include managing office stock, preparing regular reports (e.g., expenses and office budgets) and organizing company records. If you have previous experience as an Office Administrator or similar administrative role, we'd like to meet you."),
("Call Centre", "Call Centre Executive is responsible for providing assistance to customers by addressing their queries and requests. He/She advises customers on appropriate products and services based on their needs. He is responsible for the preparation of customer documentation. In the case of complex customer requests, he escalates them to senior officers. He is able to abide by safety and/or security standards in the workplace.\n\nThe Call Centre Executive pays strong attention to details to verify and process documentation. He also shows initiative and quick decision-making skills to provide excellent personalized customer services and support. He is comfortable with various stakeholder interactions whilst working in shifts and possesses adequate computer literacy to process customer documentation."),
("Consultancy Director", "The Director defines and articulates the organization's strategy for securing technical wins with prospective clients. He/She focuses on developing key growth strategies, tactics, and action plans required to achieve revenue and/or sales targets. He advises the team on developing prototypes to ensure the feasibility of solutions and oversees the delivery of in-depth presentations and product demonstrations to clients. He solves complex problems and evaluates clients' needs with different perspectives. He works in a fast-paced and dynamic environment and travels frequently to clients' premises for technical sales pitches and meetings. He is familiar with client relationship management and sales tools. He possesses deep product and technical knowledge and is knowledgeable about the trends, developments, and challenges of the industry domain. The Director is target-driven and client-centric, with the ability to foster collaboration between stakeholders. He has a deep understanding of key business industries and knowledge of products and services in the market. He is strongly committed to developing talent and inspires his team members to pursue a common vision."),
("Consultant", "The Consultant is responsible for providing Sales technical expertise to the sales team and clients during the sales process. He/She delivers presentations and technical demonstrations of the organization's products to prospective clients. He translates the client's business requirements into technical specifications and requirements and provides technical inputs for proposals, tenders, bids, and any relevant documents. He uses prescribed guidelines or policies to analyze and solve problems. He works in a fast-paced and dynamic environment and travels frequently to clients' premises for technical sales pitches and meetings. He is familiar with client relationship management and sales tools. He possesses deep product and technical knowledge and is knowledgeable about the trends, developments, and challenges of the industry domain. The Sales Consultant displays effective listening skills and is inquisitive in nature. He possesses deep technical and domain knowledge, pays attention to detail, and has strong analytical and problem-solving capabilities. He has a service-oriented personality and is a team player who works towards developing solutions collaboratively."),
("Developer", "The Developer leads important projects and possesses the capability to make breakthroughs in design, development, testing, debugging, and implementing software applications or specialized utility programs in support of end users' needs on platforms. He/She plans and coordinates regular updates and recommends improvements to existing applications. He identifies and resolves issues which have organization-wide and long-term impact. He identifies security risks, creates requirements to capture security issues, and performs initial threat modeling to ensure coding standards meet security requirements. He develops and maintains the software configuration management plan and oversees the building, verification, and implementation of software releases. He provides guidance and technical support to the quality testing teams. He works in a team setting and is proficient in programming languages required by the organization. He is familiar with software development tools and standards, as well as the relevant software platforms on which the solution is deployed on. The Developer is imaginative and creative in exploring a range of application designs and solutions. He is able to engage and support others in the team, readily put forth his ideas in a clear and compelling manner."),
("Engineering Director", "The Engineering Director is responsible for spearheading the strategic planning, design, and implementation of complex engineering solutions to meet customers' requirements. He/She drives direction and strategy for the development and execution of engineering projects and ensures alignment with the organizational strategy, vision, and mission. He formulates strategies and frameworks to drive workplace health, safety, risk, and environmental management in accordance with local and international regulations. He develops the organization's technology roadmap and drives continuous improvement strategies. In addition, he leverages his deep technical expertise and industry experience to develop technical capabilities and domain expertise for the organization. He is a professional engineer, specializing in mechanical, electrical, control and instrumentation, civil, structural, or geotechnical engineering disciplines.\n\nHe is the organization's technical expert who advises senior management and business partners on complex engineering matters. He maintains and builds strong links with the external engineering community and establishes best practices in the implementation of engineering standards");



-- Create the Skill table
CREATE TABLE IF NOT EXISTS Skill (
    Skill_Name VARCHAR(50) PRIMARY KEY,
    Skill_Desc TEXT
);

-- Create the Access_Control table
CREATE TABLE IF NOT EXISTS Access_Control (
    Access_ID INT PRIMARY KEY,
    Access_Control_Name VARCHAR(20)
);

-- Create the Staff table
CREATE TABLE IF NOT EXISTS Staff (
    Staff_ID INT PRIMARY KEY,
    Staff_FName VARCHAR(50) NOT NULL,
    Staff_LName VARCHAR(50) NOT NULL,
    Dept VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Access_ID INT,
    FOREIGN KEY (Access_ID) REFERENCES Access_Control(Access_ID)
);

-- Create the Role_Skill table
CREATE TABLE IF NOT EXISTS Role_Skill (
    Role_Name VARCHAR(20),
    Skill_Name VARCHAR(50),
    PRIMARY KEY (Role_Name, Skill_Name),
    FOREIGN KEY (Role_Name) REFERENCES Role(Role_Name),
    FOREIGN KEY (Skill_Name) REFERENCES Skill(Skill_Name)
);

-- Create the Staff_Skill table
CREATE TABLE IF NOT EXISTS Staff_Skill (
    Staff_ID INT,
    Skill_Name VARCHAR(50),
    PRIMARY KEY (Staff_ID, Skill_Name),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Skill_Name) REFERENCES Skill(Skill_Name)
);

-- Create the Open_Position table
CREATE TABLE IF NOT EXISTS Open_Position (
    Position_ID INT AUTO_INCREMENT,
    Role_Name VARCHAR(20) NOT NULL,
    Starting_Date DATE NOT NULL,
    Ending_Date DATE NOT NULL,
    PRIMARY KEY (Position_ID),
    FOREIGN KEY (Role_Name) REFERENCES Role(Role_Name)
);

-- Create the Application table
CREATE TABLE IF NOT EXISTS Application (
    Application_ID INT AUTO_INCREMENT,
    Position_ID INT NOT NULL,
    Staff_ID INT NOT NULL,
    Application_Date DATE NOT NULL,
    Cover_Letter TEXT,
    Application_Status INT NOT NULL,
    PRIMARY KEY (Application_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Position_ID) REFERENCES Open_Position(Position_ID)
);
