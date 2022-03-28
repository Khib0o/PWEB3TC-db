USE Dropbox;
SELECT IdFile, files.Name, DateLastModif, users.Name, File FROM users, files where files.IdOwner = users.IdUser;
