import 'rpg_game.dart';

enum SuperAbility { heal, boost, criticalDamage, blockRevert, diceRoll }

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

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length); // 0,1,2,3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive()) {
        if (h is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5; // 5,10
          h.blockedDamage = block;
          h.health -= (damage - block);
        } else {
          h.health -= damage;
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
    // TODO: implementation of boosting
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

class Ludoman extends Hero {
  Ludoman(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.diceRoll);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int dice1 = RpgGame.random.nextInt(6) + 1;
    int dice2 = RpgGame.random.nextInt(6) + 1;
    if (dice1 == dice2) {
      int damage = dice1 * dice2;
      boss.health -= damage;
      print('Ludoman $name hit critically $damage ');
    }
    else{ 
    int damage = dice1 + dice2;

    List<Hero> aliveHeroes = [];
        for (Hero h in heroes) {
          if (h.isAlive() && h != this) { 
            aliveHeroes.add(h);
          }
        }
     if (aliveHeroes.isNotEmpty) {
          int randomIndex = RpgGame.random.nextInt(aliveHeroes.length);
          Hero randomTeammate = aliveHeroes[randomIndex];
          
          randomTeammate.health -= damage; // Вычитаем здоровье у сокомандника
          print(' Ludoman $name rolled [$dice1 : $dice2] and damaged teammate ${randomTeammate.name} for $damage');
        }
      }
    }
  }
 

