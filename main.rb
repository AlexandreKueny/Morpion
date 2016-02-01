# encoding: UTF-8

require 'Gosu'

WIN_SIZE = [1200, 800]
COLORS = {
    RED: Gosu::Color.argb(0xffff0000),
    BLUE: Gosu::Color.argb(0xff0000ff),
    BLACK: Gosu::Color.argb(0xff000000),
    GRAY: Gosu::Color.argb(0xff808080),
    DARK_GRAY: Gosu::Color.argb(0xff606060),
    GREEN: Gosu::Color.argb(0xff00ff00)
}
GRILLE_SIZE = 300
GRILLE_POSITION = [WIN_SIZE[0] - GRILLE_SIZE - 50, (WIN_SIZE[1] - GRILLE_SIZE) / 2]
START_SIZE = 200
PATH_BIFF = [- 2 * GRILLE_SIZE / 3, - GRILLE_SIZE / 3]

class GameWindow < Gosu::Window
  def initialize(*args)
    super
    @args = *args
    @state = true
    @steps = 1
    @colors = [COLORS[:RED], COLORS[:BLUE]]
    @images = {
        background: Gosu::Image.new(self, 'D:/Dev/Ruby/Projets/Morpion/Files/Images/background_2.jpg', false)
    }
    @fonts = {
        start: Gosu::Font.new(self, Gosu.default_font_name, 150),
        restart: Gosu::Font.new(self, Gosu.default_font_name, 30)
    }
    @buttons = {
        restart: {
            size: [(@fonts[:restart].text_width('rejouer') + 20) / 2, (@fonts[:restart].height + 10) / 2],
            pos: [width - (@fonts[:restart].text_width('rejouer') + 20) / 2 - 10, (@fonts[:restart].height + 10) / 2 + 10],
            color: COLORS[:GRAY],
            state: false
        }
    }
    @grille = {
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
            others:  [
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
    @starts = {
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
    @paths = {
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
    @win = []
  end

  def needs_cursor?
    true
  end

  def button_down(button)
    case button
      when Gosu::MsLeft
        @grille.each_value do |place|
          if place[:hover]
            place[:state] = true
            place[:color] = @colors[@steps%2]
            @steps += 1
          end
        end

        @buttons.each do |k, v|
          if v[:state]
            case k
              when :restart then initialize(*@args)
            end
          end
        end

        @starts[:dts].each_value do |start|
          if start[:hover]
            start[:state] = true
            @starts[:state] = true
          end
        end
      when Gosu::KbSpace then initialize(*@args)
      when Gosu::KbEscape then close
    end
  end

  def update
    path_on = nil

    @starts[:dts].each_value do |start|
      if mouse_x > 0 and mouse_x < START_SIZE and mouse_y > start[:lines][1][1] and mouse_y < start[:lines][1][3] and not @starts[:state]
        start[:hover] = true
      else
        start[:hover] = false
      end
    end

    @grille.each_value do |place|
      color = place[:color]
      if mouse_x > place[:pos][0][0] and mouse_x < place[:pos][1][0] and mouse_y > place[:pos][0][1] and mouse_y < place[:pos][2][1] and @state and @starts[:state] and @steps < 9  and not place[:state]
        place[:hover] = true
        @paths[place[:path]][:state] = true
        path_on = @paths[place[:path]]
      else
        place[:hover] = false
        @paths[place[:path]][:state] = false unless @paths[place[:path]] == path_on
      end
      place[:others].each do |other|
        if color == @grille[other[0]][:color] and color == @grille[other[1]][:color] and @grille[other[0]][:state] and @grille[other[1]][:state] and place[:state] and @state
          @win << place
          @win << @grille[other[0]]
          @win << @grille[other[1]]
          place[:force] = true
          @grille[other[0]][:force] = true
          @grille[other[1]][:force] = true
          puts "#{COLORS.key color} won"
          @state = false
        end
      end
    end

    @buttons.each_value do |button|
      if mouse_x > button[:pos][0] - button[:size][0] and mouse_x < button[:pos][0] + button[:size][0] and mouse_y > button[:pos][1] - button[:size][1] and mouse_y < button[:pos][1] + button[:size][1]
        button[:color] = COLORS[:DARK_GRAY]
        button[:state] = true
      else
        button[:color] = COLORS[:GRAY]
        button[:state] = false
      end
    end
  end

  def draw
    backup = []

    @images[:background].draw(0, 0, 0)

    @fonts[:start].draw_rel('1', START_SIZE / 2, START_SIZE / 2, 0, 0.5, 0.5, 1, 1, COLORS[:GRAY])
    @fonts[:start].draw_rel('2', START_SIZE / 2, height - START_SIZE / 2, 0, 0.5, 0.5, 1, 1, COLORS[:GRAY])

    button = @buttons[:restart]
    draw_quad(button[:pos][0] - button[:size][0], button[:pos][1] - button[:size][1], button[:color],
              button[:pos][0] + button[:size][0], button[:pos][1] - button[:size][1], button[:color],
              button[:pos][0] + button[:size][0], button[:pos][1] + button[:size][1], button[:color],
              button[:pos][0] - button[:size][0], button[:pos][1] + button[:size][1], button[:color])
    @fonts[:restart].draw_rel('rejouer', button[:pos][0], button[:pos][1], 0, 0.5, 0.5, 1, 1, COLORS[:BLACK])

    @starts[:dts].each_value do |start|
      (start[:state] or start[:hover]) ? color = COLORS[:GREEN] : color = COLORS[:BLACK]
      start[:lines].each do |line|
        draw_line(line[0], line[1], color, line[2], line[3], color)
      end
    end

    @grille.each_value do |place|
      place[:hover] ? color = COLORS[:GREEN] : color = COLORS[:BLACK]
      place[:force] ? color = place[:color] : nil
      (0..3).each do |i|
        unless backup.include? [place[:pos][i%4], place[:pos][(i+1)%4]] or backup.include? [place[:pos][i%4], place[:pos][(i+1)%4]].reverse
          draw_line(place[:pos][i%4][0], place[:pos][i%4][1], color, place[:pos][(i+1)%4][0], place[:pos][(i+1)%4][1], color)
        end
        backup << [place[:pos][i%4], place[:pos][(i+1)%4]] if (place[:hover] or place[:force])
      end
      if place[:state]
        d = Math.cos(Math::PI/4) * (Math.sqrt(2*(GRILLE_SIZE/3) ** 2) - 9 * Math.sqrt(2*(GRILLE_SIZE/3) ** 2) / 10)
        draw_line(place[:pos][0][0] + d, place[:pos][0][1] + d, place[:color], place[:pos][2][0] - d, place[:pos][2][1] - d, place[:color])
        draw_line(place[:pos][1][0] - d, place[:pos][1][1] + d, place[:color], place[:pos][3][0] + d, place[:pos][3][1] - d, place[:color])
      end
    end

    @paths.each_value do |path|
      path[:state] ? color = COLORS[:GREEN] : color = COLORS[:BLACK]
      path[:lines].each do |line|
        draw_line(line[0], line[1], color, line[2], line[3], color) unless backup.include? line
        backup << line if path[:state]
      end
    end
  end
end

window = GameWindow.new(WIN_SIZE[0], WIN_SIZE[1], false)
window.show