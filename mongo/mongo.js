const { MongoClient } = require('mongodb');
// Replace the uri string with your MongoDB deployment's connection string.
const uri = 'mongodb+srv://tobiasafischer:<password>@cluster0.w6ewd.mongodb.net/reviewDB?retryWrites=true&w=majority';
const client = new MongoClient(uri);
async function run() {
  try {
    await client.connect();
    const database = client.db('reviewsDB');
    const reviews = database.collection('reviewsCollection');
    // Query for a movie that has the title 'Back to the Future'
    const query = { title: 'test' };
    const review = await reviews.findOne(query);
    console.log(review);
  } finally {
    // Ensures that the client will close when you finish/error
    await client.close();
  }
}
run().catch(console.dir);
