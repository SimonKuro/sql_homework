-- Задача 1: Вывести имена юзеров не из France

      db.users.find(
      { country: {$ne:'France'}},
      { fullname: 1, _id: 0 }
)

-- Задача 2: Добавить несколько реакций на треки

      db.reactions.insertMany([
      { author_id: 1, title: 'Track 1', reaction_type: 'dislike' },
      { author_id: 2, title: 'Track 2', reaction_type: 'dislike' },
      { author_id: 3, title: 'Track 3', reaction_type: 'like' },
      { author_id: 4, title: 'Track 4', reaction_type: 'like' },
      { author_id: 5, title: 'Track 5', reaction_type: 'dislike' }
])

-- Задача 3: Вывести названия треков продолжительностью от 1 до 10 мин

      db.tracks.find(
      { duration_secs: { $gte: 1 * 60, $lte: 10 * 60 } },
      { title: 1, _id: 0 }
)

-- Задача 4: Вывести треки юзера 4

      db.tracks.find(
      {author_id: 4 },
      {author_id: 0, duration_secs: 0, _id: 0 }
)