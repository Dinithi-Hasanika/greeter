import ballerina/http;
import ballerina/io;

type Album readonly & record {|
    string title;
    string artist;
|};

listener http:Listener httpListener = new (9090);

//table<Album> key(title) albums = table [
  //  {title: "Blue Train", artist: "John Coltrane"},
  //  {title: "Jeru", artist: "Gerry Mulligan"}
//];

service / on httpListener {

    resource function get albums(@http:Header string Authorization) returns Album[] {
         io:println("Request came with following token");
        io:println(Authorization);
        io:println(" ");
       // return albums.toArray();
       return "Welcome";
    }

    resource function post albums(Album album) returns Album {
        albums.add(album);
        return album;
    }
}

