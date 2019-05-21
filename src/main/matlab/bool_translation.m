function str = bool_translation(pot_bool)
    switch pot_bool
        case 'true'
            str = '1';
        case 'false'
            str = '0';
        otherwise
            str = pot_bool;
    end
end
