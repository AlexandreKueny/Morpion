# encoding: UTF-8

class GameVars
  
  def setGrid
    grille = {
        a: {
            pos: [
                [GRILLE_POSITION[0], GRILLE_POSITION[1]],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1]],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0], GRILLE_POSITION[1] + GRILLE_SIZE / 3],
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :a,
            others: [
                [:b, :c],
                [:d, :g],
                [:e, :i]
            ]
        },
        b: {
            pos: [
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1]],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1]],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3]
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :a,
            others: [
                [:a, :c],
                [:e, :h]
            ]
        },
        c: {
            pos: [
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1]],
                [GRILLE_POSITION[0] + GRILLE_SIZE, GRILLE_POSITION[1]],
                [GRILLE_POSITION[0] + GRILLE_SIZE, GRILLE_POSITION[1]+ GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3]
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :a,
            others: [
                [:a, :b],
                [:f, :i],
                [:e, :g]
            ]
        },
        d: {
            pos: [
                [GRILLE_POSITION[0], GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0], GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3]
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :b,
            others: [
                [:a, :g],
                [:e, :f]
            ]
        },
        e: {
            pos: [
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3]
            ],
            force: false,
            hover: false,
            state: true,
            color: COLORS[:RED],
            path: :b,
            others: [
                [:b, :h],
                [:d, :f],
                [:a, :i],
                [:c, :g]
            ]
        },
        f: {
            pos: [
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE, GRILLE_POSITION[1] + GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3]
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :b,
            others: [
                [:c, :i],
                [:d, :e]
            ]
        },
        g: {
            pos: [
                [GRILLE_POSITION[0], GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE],
                [GRILLE_POSITION[0], GRILLE_POSITION[1] + GRILLE_SIZE],
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :c,
            others: [
                [:a, :d],
                [:h, :i]
            ]
        },
        h: {
            pos: [
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE],
                [GRILLE_POSITION[0] + GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE],
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :c,
            others: [
                [:b, :e],
                [:g, :i]
            ]
        },
        i: {
            pos: [
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE, GRILLE_POSITION[1] + 2 * GRILLE_SIZE / 3],
                [GRILLE_POSITION[0] + GRILLE_SIZE, GRILLE_POSITION[1] + GRILLE_SIZE],
                [GRILLE_POSITION[0] + 2 * GRILLE_SIZE / 3, GRILLE_POSITION[1] + GRILLE_SIZE]
            ],
            force: false,
            hover: false,
            state: false,
            color: nil,
            path: :c,
            others: [
                [:c, :f],
                [:g, :h],
                [:a, :e]
            ]
        }
    }
    grille
  end

  def setCoords
    coords = {
        a: {
            text: 'A',
            pos: [GRILLE_POSITION[0] + GRILLE_SIZE / 6, GRILLE_POSITION[1] - GRILLE_SIZE / 6]
        },
        b: {
            text: 'B',
            pos: [GRILLE_POSITION[0] + GRILLE_SIZE / 2, GRILLE_POSITION[1] - GRILLE_SIZE / 6]
        },
        c: {
            text: 'C',
            pos: [GRILLE_POSITION[0] + 5 * GRILLE_SIZE / 6, GRILLE_POSITION[1] - GRILLE_SIZE / 6]
        },
        d: {
            text: '1',
            pos: [GRILLE_POSITION[0] + 7 * GRILLE_SIZE / 6, GRILLE_POSITION[1] + GRILLE_SIZE / 6]
        },
        e: {
            text: '2',
            pos: [GRILLE_POSITION[0] + 7 * GRILLE_SIZE / 6, GRILLE_POSITION[1] + GRILLE_SIZE / 2]
        },
        f: {
            text: '3',
            pos: [GRILLE_POSITION[0] + 7 * GRILLE_SIZE / 6, GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6]
        }
    }
    coords
  end

  def setPaths
    paths = {
        a: {
            lines: [
                [70, GRILLE_POSITION[1] + GRILLE_SIZE / 2, GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + GRILLE_SIZE / 2],
                [GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + GRILLE_SIZE / 2, GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 2],
                [GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 6, GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 2],
                [GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 6, GRILLE_POSITION[0], GRILLE_POSITION[1] + GRILLE_SIZE / 6],
            ],
            state: false
        },
        b: {
            lines: [
                [70, GRILLE_POSITION[1] + GRILLE_SIZE / 2, GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + GRILLE_SIZE / 2],
                [GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + GRILLE_SIZE / 2, GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 2],
                [GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 2, GRILLE_POSITION[0], GRILLE_POSITION[1] + GRILLE_SIZE / 2]
            ],
            state: false
        },
        c: {
            lines: [
                [70, GRILLE_POSITION[1] + GRILLE_SIZE / 2, GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + GRILLE_SIZE / 2],
                [GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6, GRILLE_POSITION[0], GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6],
                [GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6, GRILLE_POSITION[0] + PATH_BIFF[0], GRILLE_POSITION[1] + GRILLE_SIZE / 2],
            ],
            state: false
        },
    }
    paths
  end

  def setStarts
    starts = {
        state: false,
        dts: {
            a: {
                lines: [
                    [0, START_SIZE, START_SIZE, START_SIZE],
                    [START_SIZE, 0, START_SIZE, START_SIZE]
                ],
                state: false,
                hover: false
            },
            b: {
                lines: [
                    [0, WIN_SIZE[1] - START_SIZE, START_SIZE, WIN_SIZE[1] - START_SIZE],
                    [START_SIZE, WIN_SIZE[1] - START_SIZE, START_SIZE, WIN_SIZE[1]]
                ],
                state: false,
                hover: false
            }
        }
    }
    starts
  end
  
  def setArrowsPaths(image)
    arrows_paths = {a: [], b: [], c: []}
    ((GRILLE_POSITION[0] + PATH_BIFF[1] - 75) / 10).times do |i|
      arrows_paths[:a] << Arrow.new(0, {x: 75 + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 2}, image)
    end
    ((-PATH_BIFF[1]) / 10).times do |i|
      arrows_paths[:a] << Arrow.new(0, {x: GRILLE_POSITION[0] + PATH_BIFF[1] + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 6}, image)
    end
    ((GRILLE_SIZE / 2 - GRILLE_SIZE / 6) / 10).times do |i|
      arrows_paths[:a] << Arrow.new(-90, {x: GRILLE_POSITION[0] + PATH_BIFF[1], y: GRILLE_POSITION[1] + GRILLE_SIZE / 2 - 10 * i}, image)
    end
    ((GRILLE_POSITION[0] - 75) / 10).times do |i|
      arrows_paths[:b] << Arrow.new(0, {x: 75 + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 2}, image)
    end
    ((GRILLE_POSITION[0] + PATH_BIFF[0] - 75) / 10).times do |i|
      arrows_paths[:c] << Arrow.new(0, {x: 75 + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 2}, image)
    end
    ((-PATH_BIFF[0]) / 10).times do |i|
      arrows_paths[:c] << Arrow.new(0, {x: GRILLE_POSITION[0] + PATH_BIFF[0] + 10 * i, y: GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6}, image)
    end
    ((5 * GRILLE_SIZE / 6 - GRILLE_SIZE / 2) / 10).times do |i|
      arrows_paths[:c] << Arrow.new(90, {x: GRILLE_POSITION[0] + PATH_BIFF[0], y: GRILLE_POSITION[1] + GRILLE_SIZE / 2 + 10 * i}, image)
    end
    arrows_paths
  end

  def setArrowsPlaces(image)
    arrows_places = {a: [], b: [], c: [], d: [], f: [], g: [], h: [], i: []}
    ((GRILLE_SIZE / 6) / 10).times do |i|
      arrows_places[:a] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 6}, image)
    end
    ((GRILLE_SIZE / 2) / 10).times do |i|
      arrows_places[:b] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 6}, image)
    end
    ((5 * GRILLE_SIZE / 6) / 10).times do |i|
      arrows_places[:c] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 6}, image)
    end
    ((GRILLE_SIZE / 6) / 10).times do |i|
      arrows_places[:d] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 2}, image)
    end
    ((5 * GRILLE_SIZE / 6) / 10).times do |i|
      arrows_places[:f] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + GRILLE_SIZE / 2}, image)
    end
    ((GRILLE_SIZE / 6) / 10).times do |i|
      arrows_places[:g] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6}, image)
    end
    ((GRILLE_SIZE / 2) / 10).times do |i|
      arrows_places[:h] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6}, image)
    end
    ((5 * GRILLE_SIZE / 6) / 10).times do |i|
      arrows_places[:i] << Arrow.new(0, {x: GRILLE_POSITION[0] + 10 * i, y: GRILLE_POSITION[1] + 5 * GRILLE_SIZE / 6}, image)
    end
    arrows_places
  end
end