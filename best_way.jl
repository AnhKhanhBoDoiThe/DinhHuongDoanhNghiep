WIDTH = 600
HEIGHT = 600
BACKGROUND = colorant"black"

#define game state
game_ongoing = true
score = 0
gameover = false

#define snake
#position
snake_pos_x = 10
snake_pos_y = 520
snake_size = 30
snake_head = Rect(
    snake_pos_x, snake_pos_y, snake_size, snake_size
)

#define gold
gold = Rect(540, 160, 20, 20)

#define map
wall1 = Rect(150, 200, 450, 20)
wall2 = Rect(0, 375, 400, 20)
wall3 = Rect(150, 0, 20, 130)
wall4 = Rect(250, 50, 20, 150)
wall5 = Rect(330, 0 , 20, 60)
wall6 = Rect(330, 110, 20, 110)
wall7 = Rect(400, 40, 20, 160)
wall8 = Rect(400, 40, 140, 20)
wall9 = Rect(460, 100, 20, 60)
wall10 = Rect(460, 100, 140, 20)

#draw actor
function draw(g::Game)
    #draw snake
    draw(snake_head, colorant"green", fill = true)

    #draw map
    draw(wall1, colorant"brown", fill = true)
    draw(wall2, colorant"brown", fill = true)
    draw(wall3, colorant"brown", fill = true)
    draw(wall4, colorant"brown", fill = true)
    draw(wall5, colorant"brown", fill = true)
    draw(wall6, colorant"brown", fill = true)
    draw(wall7, colorant"brown", fill = true)
    draw(wall8, colorant"brown", fill = true)
    draw(wall9, colorant"brown", fill = true)
    draw(wall10, colorant"brown", fill = true)
    
    #draw gold
    draw(gold, colorant"yellow", fill = true)
    
    #draw txt score
    if collide(snake_head, gold)
        txt = TextActor("You Win! Your Scor = $score", "poppins";
            font_size = 36, color = Int[0, 255, 255, 255])
        txt.pos = (130, 300)
        draw(txt)
    else
        txt = TextActor("Your Score = $score", "poppins";
            font_size = 36, color = Int[0, 255, 255, 255])
        txt.pos = (10, 550)
        draw(txt)
    end
end

#move by mouse
function on_mouse_move(g::Game, pos)
    snake_head.x = pos[1]
    snake_head.y = pos[2]
end

#move by keyboard
function on_key_down(g::Game)
    if collide(snake_head, gold)
        global game_ongoing = false
    elseif g.keyboard.UP
        collide(snake_head, wall1) || collide(snake_head, wall2) || collide(snake_head, wall3) || collide(snake_head, wall4) || collide(snake_head, wall5) || collide(snake_head, wall6) || collide(snake_head, wall7) || collide(snake_head, wall8) || collide(snake_head, wall9) || collide(snake_head, wall10) ?
            snake_head.y = snake_head.y + 10 : snake_head.top != 0 ?
                snake_head.y -= 10 : snake_head.y = snake_head.y
                global score -= 1
        global score += 1
    elseif g.keyboard.DOWN
        collide(snake_head, wall1) || collide(snake_head, wall2) || collide(snake_head, wall3) || collide(snake_head, wall4) || collide(snake_head, wall5) || collide(snake_head, wall6) || collide(snake_head, wall7) || collide(snake_head, wall8) || collide(snake_head, wall9) || collide(snake_head, wall10) ?
            snake_head.y = snake_head.y - 10 : snake_head.bottom != 600 ?
                snake_head.y += 10 : snake_head.y = snake_head.y
                global score -= 1
        global score += 1
    elseif g.keyboard.LEFT
        collide(snake_head, wall1) || collide(snake_head, wall2) || collide(snake_head, wall3) || collide(snake_head, wall4) || collide(snake_head, wall5) || collide(snake_head, wall6) || collide(snake_head, wall7) || collide(snake_head, wall8) || collide(snake_head, wall9) || collide(snake_head, wall10) ?
            snake_head.x = snake_head.x + 10 : snake_head.left != 0 ?
                snake_head.x -= 10 : snake_head.x = snake_head.x
                global score -= 1
        global score += 1
    elseif g.keyboard.RIGHT
        collide(snake_head, wall1) || collide(snake_head, wall2) || collide(snake_head, wall3) || collide(snake_head, wall4) || collide(snake_head, wall5) || collide(snake_head, wall6) || collide(snake_head, wall7) || collide(snake_head, wall8) || collide(snake_head, wall9) || collide(snake_head, wall10) ?
            snake_head.x = snake_head.x - 10 : snake_head.right != 600 ?
                snake_head.x += 10 : snake_head.x = snake_head.x
                global score -= 1
        global score += 1
    end
end

# function border()
#     global gameover
#     if snake_head.x == WIDTH ||
#         snake_head.x < 0 ||
#         snake_head.y == HEIGHT ||
#         snake_head.y < 0
#             gameover = true
#     end
# end

# function update(g::Game)
#     if gameover == false
#         global score
#         border()
#     end
# end