# Load the library
library(XML)

# Load the XML document
doc = xmlTreeParse("c:/Users/Automaton/gpx/ride-truncated.gpx", useInternal = TRUE)

# Get a reference to the root node of the XML document
top = xmlRoot(doc)

# Show the names of the various nodes
xmlName(top) # The root node (returns "gpx")
names(top) # Returns "metadata" & "trk" as the children of the root node
names(top[[1]]) # Returns "time" as the child  of the first "metadata" node
names(top[[2]]) # Returns "trkseg" as the children of the second "trk" node

# Get a reference to the trkseg node (which contains all the "trkpoint" nodes)
track = top[[2]][["trkseg"]]

# Show the text values for the first track child node (a "trkseg")
xmlSApply(track[[1]], xmlValue) # Returns values for "ele", "time" and "extensions" (note that "exentions" concatenates the text of all the child nodes so will need further processing)
