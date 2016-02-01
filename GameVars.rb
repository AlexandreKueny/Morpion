# encoding: UTF-8   
class GameVars
  
  def initialize(pos, size)
    @pos = pos
    @size = size
  end
  
  def setGrid
    grille = {
        a: {
            pos: [
                [@pos[0], @pos[1]],
                [@pos[0] + @size / 3, @pos[1]],
                [@pos[0] + @size / 3, @pos[1] + @size / 3],
                [@pos[0], @pos[1] + @size / 3],
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
                [@pos[0] + @size / 3, @pos[1]],
                [@pos[0] + 2 * @size / 3, @pos[1]],
                [@pos[0] + 2 * @size / 3, @pos[1] + @size / 3],
                [@pos[0] + @size / 3, @pos[1] + @size / 3]
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
                [@pos[0] + 2 * @size / 3, @pos[1]],
                [@pos[0] + @size, @pos[1]],
                [@pos[0] + @size, @pos[1]+ @size / 3],
                [@pos[0] + 2 * @size / 3, @pos[1] + @size / 3]
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
                [@pos[0], @pos[1] + @size / 3],
                [@pos[0] + @size / 3, @pos[1] + @size / 3],
                [@pos[0] + @size / 3, @pos[1] + 2 * @size / 3],
                [@pos[0], @pos[1] + 2 * @size / 3]
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
                [@pos[0] + @size / 3, @pos[1] + @size / 3],
                [@pos[0] + 2 * @size / 3, @pos[1] + @size / 3],
                [@pos[0] + 2 * @size / 3, @pos[1] + 2 * @size / 3],
                [@pos[0] + @size / 3, @pos[1] + 2 * @size / 3]
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
                [@pos[0] + 2 * @size / 3, @pos[1] + @size / 3],
                [@pos[0] + @size, @pos[1] + @size / 3],
                [@pos[0] + @size, @pos[1] + 2 * @size / 3],
                [@pos[0] + 2 * @size / 3, @pos[1] + 2 * @size / 3]
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
                [@pos[0], @pos[1] + 2 * @size / 3],
                [@pos[0] + @size / 3, @pos[1] + 2 * @size / 3],
                [@pos[0] + @size / 3, @pos[1] + @size],
                [@pos[0], @pos[1] + @size],
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
                [@pos[0] + @size / 3, @pos[1] + 2 * @size / 3],
                [@pos[0] + 2 * @size / 3, @pos[1] + 2 * @size / 3],
                [@pos[0] + 2 * @size / 3, @pos[1] + @size],
                [@pos[0] + @size / 3, @pos[1] + @size],
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
                [@pos[0] + 2 * @size / 3, @pos[1] + 2 * @size / 3],
                [@pos[0] + @size, @pos[1] + 2 * @size / 3],
                [@pos[0] + @size, @pos[1] + @size],
                [@pos[0] + 2 * @size / 3, @pos[1] + @size]
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
                [GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 6, GRILLE_POSITION[0], GRILLE_POSITION[1] + GRILLE_SIZE / 6],
                [GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 6, GRILLE_POSITION[0] + PATH_BIFF[1], GRILLE_POSITION[1] + GRILLE_SIZE / 2]
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

  def setStarts(height)
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
                    [0, height - START_SIZE, START_SIZE, height - START_SIZE],
                    [START_SIZE, height - START_SIZE, START_SIZE, height]
                ],
                state: false,
                hover: false
            }
        }
    }
    starts
  end
end