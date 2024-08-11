// point at new target db
db = db.getSiblingDB('admin');
// log in as admin to fire commands
db.auth('admin', 'password');
// make new db
db.getSiblingDB('games').createCollection('gameHistory')
// add user
db.createUser(
    {
        user: "ef_core",
        pwd: "password",
        roles: [
            {
                role: "readWrite",
                db: "games"
            }
        ]
    }
);