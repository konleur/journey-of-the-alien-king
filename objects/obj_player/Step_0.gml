// Movement
var move_speed = 1;
var moving = false;
if (keyboard_check(ord("W")))
{
    y -= move_speed;
    sprite_index = spr_player_up;
	moving = true;
}
if (keyboard_check(ord("S")))
{
    y += move_speed;
    sprite_index = spr_player_down;
	moving = true;
}
if (keyboard_check(ord("A")))
{
    x -= move_speed;
    sprite_index = spr_player_left;
	moving = true;
}
if (keyboard_check(ord("D")))
{
    x += move_speed;
    sprite_index = spr_player_right;
	moving = true;
}

// Shooting
if (mouse_check_button_pressed(mb_left))
{
    var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
    
    switch (sprite_index)
    {
        case spr_player_left:
            bullet.direction = 180;
            break;
        case spr_player_right:
            bullet.direction = 0;
            break;
        case spr_player_down:
            bullet.direction = 270;
            break;
        case spr_player_up:
            bullet.direction = 90;
            break;
    }
}

if (place_meeting(x, y, obj_wall)) {
	switch (sprite_index)
    {
        case spr_player_left:
            x += 1;
            break;
        case spr_player_right:
            x -= 1;
            break;
        case spr_player_down:
            y -= 1;
            break;
        case spr_player_up:
            y += 1;
            break;
    }
}