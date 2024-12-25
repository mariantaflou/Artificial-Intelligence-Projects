 find_sim_1(X, Y):- genre(X, G1), genre(Y, G1), X= Y.

similar(X, Y, G):- genre(X, G), genre(Y, G), X= Y. similar_gern1(X, Y):- similar(X, Y, G). similar_gern2(X, Y):- similar(X, Y, G1), similar(X, Y, G2), G1 =G2.

similar_enough(X, Y):- similar(X, Y, G1), similar(X, Y, G2), similar(X, Y, G3),similar(X, Y, G4), G1=G2, G2=G3, G1=G3, G1=G4, G2=G4, G3=G4. find_sim_3(X, Y):- similar(X, Y, G1), similar(X, Y, G2), similar(X, Y, G3), G1=G2, G2=G3, G1=G3.

same_director(X, Y):- director_name(X, G1), director_name(Y, G1), X= Y.

same_plot(X,Y):- plot_keywords(X, P), plot_keywords(Y, P), X=Y. similar2(X, Y, G):- plot_keywords(X, G), plot_keywords(Y, G), X= Y. similar_plot(X, Y):- similar2(X, Y, G1), similar2(X, Y, G2), similar2(X, Y, G3), G1=G2, G2=G3, G1=G3. similar_enough_plot(X, Y):- similar2(X, Y, G1), similar2(X, Y, G2), similar2(X, Y, G3),similar2(X, Y, G4), G1=G2, G2=G3, G1=G3, G1=G4, G2=G4, G3=G4. same_plot1(X, Y):- similar2(X, Y, G). same_plot2(X, Y):- similar2(X, Y, G1), similar2(X, Y, G2), G1=G2.

same_actors(X, Y, A) :- actor(X, A), actor(Y, A), X = Y. three_actors(X, Y):- same_actors(X, Y, A1), same_actors(X, Y, A2), same_actors(X, Y, A3), A1 =A2, A1 =A3, A2 =A3. two_actors(X, Y):- same_actors(X, Y, A1), same_actors(X, Y, A2), A1 =A2. one_actor(X, Y):- same_actors(X, Y, A).

same_lang(X, Y):- language(X, L1), language(Y, L1), X= Y.

black_and_white(X):- plot_keywords(X, 'black and white').

same_production_company(X, Y):- production_companies(X, P1), production_companies(Y, P1), X= Y. pcompany(X, Y, C):- production_companies(X, C), production_companies(Y, C), X = Y. two_companies(X, Y):- pcompany(X, Y, C1), pcompany(X, Y, C2), C1 =C2.

same_production_country(X, Y):- production_countries(X, P1), production_countries(Y, P1), X= Y.

same_decade(X, Y):- decade(X, L1), decade(Y, L1), X= Y.

/Part 2/

find_similar_1(X, Y):- similar_gern1(X, Y).

find_similar_2(X, Y):- similar_gern1(X, Y), same_plot1(X,Y). find_similar_3(X, Y):- similar_gern2(X, Y), same_plot2(X, Y), same_lang(X, Y).

find_similar_4(X, Y):- similar_gern1(X, Y), same_production_country(X, Y).

find_similar_5(X, Y):- similar_gern2(X, Y), same_plot2(X, Y), same_lang(X, Y). find_similar_6(X, Y) :- similar_enough_plot(X, Y), same_plot2(X, Y), two_companies(X, Y). find_similar_7(X, Y):- similar_enough_plot(X, Y).

find_similar_8(X, Y) :- similar_enough_plot(X, Y), similar_plot(X, Y), one_actor(X, Y), same_lang(X, Y).

find_similar_9(X, Y) :- (same_director(X, Y), similar_gern1(X, Y)) ; (three_actors(X, Y)(X, Y), similar_gern2(X, Y)).