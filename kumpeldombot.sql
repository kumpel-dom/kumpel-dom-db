USE kumpeldombot;
# Creating the tables. The names are in the 
# plural form because of the actions table 
# (action is a reserved word)
## Create the node table
CREATE TABLE nodes(
	nodeid INT UNIQUE NOT NULL PRIMARY KEY,
    nodename VARCHAR(16)
)ENGINE=InnoDB;
## Create the area table
CREATE TABLE areas(
	areaid INT UNIQUE NOT NULL PRIMARY KEY,
    areaname VARCHAR(16),
    nodeid INT NOT NULL
)ENGINE=InnoDB;
# Create the action table
CREATE TABLE actions(
	actionid INT NOT NULL PRIMARY KEY,
    actionname VARCHAR(16),
    areaid INT NOT NULL
)ENGINE=InnoDB;
# Adding foreign key constraint
## Make areas.nodeid a foreign key
ALTER TABLE areas
	ADD CONSTRAINT fk_nodeid FOREIGN KEY (nodeid)
    REFERENCES nodes(nodeid);
## Make actions.areaid a foregn key
ALTER TABLE actions
	ADD CONSTRAINT tk_areaid FOREIGN KEY (areaid)
    REFERENCES areas(areaid);