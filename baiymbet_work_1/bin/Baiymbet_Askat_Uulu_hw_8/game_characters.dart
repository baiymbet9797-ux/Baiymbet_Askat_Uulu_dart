import 'rpg_game.dart';

enum SuperAbility {
  heal,
  boost,
  criticalDamage,
  blockRevert,
  takeDamage,
  resurrect,
  stun,
  shurikenThrow,
}

abstract class GameCharacter {
  String name;
  int _health;
  int damage;

  set health(int value) {
    if (value < 0) {
      _health = 0;
    } else {
      _health = value;
    }
  }

  int get health => _health;

  GameCharacter(this.name, this._health, this.damage);

  bool isAlive() {
    return health > 0;
  }

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length);
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    Golem? golem;
    for (Hero h in heroes) {
      if (h.isAlive() && h is Golem) {
        golem = h;
        break;
      }
    }

    for (Hero h in heroes) {
      if (h.isAlive()) {
        if (h is Golem) {
          h.health -= damage;
          continue;
        }

        if (h is Lucky) {
          if (RpgGame.random.nextInt(100) < 25) {
            print('Lucky ${h.name} dodged the attack!');
            continue;
          }
        }

        int currentDamage = damage;
        if (h is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5; // 5,10
          h.blockedDamage = block;
          currentDamage = damage - block;
        }

        if (golem != null && golem.isAlive()) {
          int share = currentDamage ~/ 5;
          int remainder = currentDamage - share;

          h.health -= remainder;
          golem.health -= share;
        } else {
          h.health -= currentDamage;
        }
      }
    }
  }

  @override
  String toString() {
    if (defence == null) {
      return '${super.toString()} defence: No defence';
    } else {
      return '${super.toString()} defence: ${defence!.name}';
    }
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = (RpgGame.random.nextInt(5) + 2) * damage; // 2,3,4,5,6
    boss.health -= crit;
    print('Warrior $name hit critically $crit');
  }
}

class Magic extends Hero {
  Magic(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      int boostPoints = RpgGame.random.nextInt(5) + 5;
      for (Hero h in heroes) {
        if (h.isAlive() && h != this) {
          h.damage += boostPoints;
        }
      }
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;

  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage');
  }
}

class Healer extends Hero {
  int healPoints;

  Healer(String name, int health, int damage, this.healPoints)
    : super(name, health, damage, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive() && h != this) {
        h.health += healPoints;
      }
    }
  }
}

class Golem extends Hero {
  Golem(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.takeDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Lucky extends Hero {
  Lucky(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.takeDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Witcher extends Hero {
  bool _hasResurrected = false;
  Witcher(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.resurrect);

  @override
  void attack(Boss boss) {}

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (this.isAlive() && !_hasResurrected) {
      for (Hero h in heroes) {
        if (!h.isAlive() && h != this) {
          h.health = this.health;
          this.health = 0;
          _hasResurrected = true;
          print('Witcher $name resurrected ${h.name}');
          break;
        }
      }
    }
  }
}

class Thor extends Hero {
  Thor(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor ${this.name} stunned the boss!');
    } else {
      print('Thor ${this.name} failed to stun the boss.');
    }
  }
}

class Samurai extends Hero {
  Samurai(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.shurikenThrow);
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (this.isAlive()) {
      int n = RpgGame.random.nextInt(21) + 10;

      if (RpgGame.random.nextBool()) {
        boss.health -= n;
        print(
          ' Samurai $name threw a VIRUS shuriken! Dealt $n damage to the boss.',
        );
      } else {
        boss.health += n; 
        print(
          'Samurai $name threw a VACCINE shuriken! Healed the boss for $n HP.',
        );
      }
    }
  }
}
