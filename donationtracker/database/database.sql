CREATE TABLE organizations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE donations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  organization_id INT NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);