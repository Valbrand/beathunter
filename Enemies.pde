abstract class Creature extends GameObject {
	Creature(float x, float y, float offX, float offY) {
		super(x, y, offX, offY);
	}

	abstract void behaviour();
};

// not yet implemented. going to do that next
// Daniel
class Pig extends Creature {
	int directionModifier;
	VisualState sprite;

	Pig(float x, float y) {
		super(x, y - 45, 0, -7);

		this.hitbox = new Rectangle(this.getCenter(), 90, 65);

		sprite = new Animation("pig", 8);

		this.directionModifier = -1;
	}

	void behaviour() {
		float xPos = this.getCenter().getX();
		int cti = this.getCurrentTerrainIndex();

		if(this.directionModifier < 0) {
			if(xPos - this.centerToLeft() - PIG_SPEED < TERRAIN_LIST[cti].getStartingPosition()) {
				if(cti == 0 || TERRAIN_LIST[cti - 1].getMinimumHeight() == 0 ||
						TERRAIN_LIST[cti - 1].getMinimumHeight() > TERRAIN_LIST[cti].getMinimumHeight()) {
					this.directionModifier *= -1;
				}
			}
		} else {
			if(xPos + this.centerToRight() + PIG_SPEED > TERRAIN_LIST[cti].getEndPosition()) {
				if(cti == TERRAIN_LIST.length - 1 || TERRAIN_LIST[cti + 1].getMinimumHeight() == 0 ||
						TERRAIN_LIST[cti + 1].getMinimumHeight() > TERRAIN_LIST[cti].getMinimumHeight()) {
					this.directionModifier *= -1;
				}
			}
		}

		this.setSpeedX((this.isStanding()) ? PIG_SPEED * this.directionModifier : 0);
	}

	void render() {
		pushMatrix();
		translate(this.getScreenXPosition(), this.getScreenYPosition());
		if(this.directionModifier > 0) {
			scale(-1, 1);
		}
		this.sprite.draw(0, 0);
		popMatrix();

		// this.hitbox.render();
	}
};

class Monkey extends Creature {
	Monkey(float x, float y, float offX, float offY) {
		super(x, y, offX, offY);
	}

	void behaviour() {
		//atirar a cada n segundos
	}

	void render() {
		
	}
}