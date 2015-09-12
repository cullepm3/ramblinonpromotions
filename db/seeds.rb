# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def z(field)
  field.blank? ? 0 : field
end

def x(field)
  !!(field && field.strip == 'X')
end

File.readlines(File.expand_path('../players-sanitized.csv', __FILE__)).each do |line|
  splits = line.split(',')
  Player.create(name:splits[0], image_url:splits[1])
end

File.readlines(File.expand_path('../teams-sanitized.csv', __FILE__)).each do |line|
  splits = line.split(',')
  Team.create(
    year: splits[0],
    name: splits[1],
    manager_id: Player.find_by_name(splits[2]).id,
    assistant_id: Player.find_by_name(splits[3]).try(:id),
    draft: splits[4],
    r1: z(splits[5]),
    r2: z(splits[6]),
    r3: z(splits[7]),
    r4: z(splits[8]),
    r5: z(splits[9]),
    r6: z(splits[10]),
    wins: z(splits[11]),
    pts: z(splits[12]),
    low: x(splits[13]),
    earnings: z(splits[14]),
    ptschamp: x(splits[15]),
    goat: x(splits[16]))
end

