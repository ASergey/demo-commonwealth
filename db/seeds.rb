# frozen_string_literal: true

authors = [
  {
    firstname: 'Александр',
    lastname: 'Александров'
  },
  {
    firstname: 'Иван',
    lastname: 'Иванов'
  }
].map { |el| Author.create!(el) }

skills = [
  { name: 'Финансовая безопасность' },
  { name: 'Инофрмационная гигиена' },
  { name: 'Управление персоналом' },
  { name: 'Бухгалтерский учёт' },
  { name: 'Документооборот' }
].map { |el| Skill.create!(el) }

authors.each_with_index do |author, i|
  Course.create!({
                   title: "Финансы - #{i}",
                   author:,
                   skills: skills.first(2)
                 })

  Course.create!({
                   title: "Документы - #{i}",
                   author:,
                   skills: skills.last(3)
                 })
end
