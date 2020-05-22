# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jill = User.create(name: "Jill", email: "jill@jill.com", password: "jill")
 Tree.delete_all
blues = Tree.create(title: "Blues", description: "baby inspired blues melody")
bouncy = Tree.create(title: "Bouncy melody", description: "a real bouncy kind of melody")
ballad = Tree.create(title: "Ballad of Pooh", description: "A real sad song for winnie the pooh")
bunny = Tree.create(title: "Don't cry Bunny RaRa", description: "A lullaby for a stuffed bunny")

Note.delete_all 
blues_note1 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm")
blues_note2 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm", parent_note_id: blues_note1.id)
blues_note3 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm", parent_note_id: blues_note1.id)
blues_note4 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm", parent_note_id: blues_note2.id)
blues_note5 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm", parent_note_id: blues_note2.id)
blues_note6 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm", parent_note_id: blues_note3.id)
blues_note7 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm", parent_note_id: blues_note6.id)
blues_note8 = blues.notes.create(title: "try a shuffle groove", description: "changed the rhythm", parent_note_id: blues_note6.id)
