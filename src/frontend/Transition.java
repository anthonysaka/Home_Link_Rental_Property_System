package frontend;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Node;
import javafx.util.Duration;

public class Transition {

	//Adapted from: https://www.youtube.com/watch?v=x-vlOrUBxjc
	public static void applyTransition(Node node, Duration duration, EventHandler<ActionEvent> event) {
		javafx.animation.FadeTransition fadeIn = new javafx.animation.FadeTransition(duration, node);
		fadeIn.setCycleCount(1);
		fadeIn.setFromValue(0.8);
		fadeIn.setToValue(2);
		fadeIn.setAutoReverse(true);
		fadeIn.setOnFinished(event);
		
		javafx.animation.FadeTransition fadeout = new javafx.animation.FadeTransition(duration, node);
		fadeout.setCycleCount(1);
		fadeout.setFromValue(2);
		fadeout.setToValue(0.8);
		fadeout.setAutoReverse(true);
		fadeout.setOnFinished(event);
		
		fadeout.play();
		fadeout.setOnFinished((e) -> {
			fadeIn.play();
		});
	}
}
