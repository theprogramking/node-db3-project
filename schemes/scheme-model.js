const knex = require("knex");
const config = require("../knexfile.js");
const db = knex(config.development);

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(schemeId) {
  return db("steps as st")
    .join("schemes as s", "st.scheme_id", "s.id")
    .select("*");
}

function add(scheme) {
  db("schemes")
    .insert(scheme)
    .then((ids) => {
      return findById(ids[0]);
    });
}

function update(changes, id) {
  db("schemes").where({ id }).update(changes);
}

function remove(id) {
  db("schemes").where({ id }).del();
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};
