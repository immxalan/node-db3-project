const db = require("../data/db-config");

module.exports = {
find, findById, findSteps, add, update, remove, addStep
}

function find () {
    return db("schemes")
}

function findById (id) {
    return db("schemes")
    .where({id})
    .first();
}

function findSteps (id){
    return db("steps")
    .join("schemes", "steps.scheme_id", "schemes.id")
    .select(
        "steps.scheme_id",
        "schemes.scheme_name",
        "steps.step_number",
        "steps.instructions"
    )
    .orderBy("step_number")
    .where("schemes.id", id)
}

function add(post){
    return db("schemes")
    .insert(post)
}
function addStep(step, scheme_id){
    return db("steps")
    .insert(step, scheme_id)
}
function update(changes, id) {
    return db("schemes")
    .where({id})
    .update(changes)
    .then(()=>{
        return findById(id);
    })
}

function remove (id){
    return db("schemes")
    .where({id})
    .del()
}