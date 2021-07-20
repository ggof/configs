local terminal = "urxvt"

awesome_menu = {
    {"manual", terminal .. ' -e "man awesome"'},
    {"restart", awesome.restart},
    {
        "quit",
        function()
            awesome.quit()
        end
    }
}

return awesome_menu