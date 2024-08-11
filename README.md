# Nkno.Dev.Scripts
## About
This is just an active respository of the docker containers & sql scripts I'm using on my Nkno.Dev personal project.

The project only currently works locally anyway, so this will just be what I am running locally in order to run off of containers.

I suppose a nice goal someday is to superconsolidate all the scripts under a singular container (if feasable) and run the C# Server, MongoDB and SQL instances as a singular entity.

### Why Two DB Sources
Just trying to keep myself acclimated to both. I've actually run into unique errors and problems each step of the way with Docker, so it's a learning experience. 

Other than that? I'd like to show some work that shows a potential (albeit weird) use case for Dependancy Injection.

## Subfolders
### docker/
All the docker scripts I'm running currently to run entirely through containers, rather than local instances. Maybe I'll update more details and add more detailed compose/docker files.

### sql/
The SQL data in the project uses database scripts from FFXIV's ACT parser, and that parser will autopopulate the tables it uses. My scripts are specifically to build tables and to build stored procedures to nurse the aged data model to allow for better many-to-many relationships through gap and island analysis. A fair amount of help was asked from ChatGPT, but I had to tweak queries to ensure that the stored procs do not replicate data.
