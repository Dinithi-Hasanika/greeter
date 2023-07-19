import ballerina/http;

type Album record {|
    string title;
    string artist;
|};

//listener http:Listener httpListener = new (9090);

table<Album> albums = table [
    {title: "Blue Train", artist: "John Coltrane"},
    {title: "Jeru", artist: "Gerry Mulligan"}
];

service / on new http:Listener(9090) {

    resource function get albums(@http:Header string Authorization) returns Album[] {
        //  io:println("Request came with following token");
        // io:println(Authorization);
        // io:println(" ");
        return albums.toArray();
    }

    resource function post albums(Album album) returns Album {
        albums.add(album);
        return album;
    }
}

