import 'game_characters.dart';
import 'dart:math';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void startGame() {
    Boss boss = Boss('Dragon', 1000, 50);

    Warrior warrior1 = Warrior('Ahiles', 280, 15);
    Warrior warrior2 = Warrior('Hercules', 290, 10);
    Magic magic = Magic('Stange', 270, 15);
    Berserk berserk = Berserk('Axe', 260, 10);
    Healer doc = Healer('Jake', 250, 5, 15);
    Healer assistant = Healer('Junior', 300, 5, 5);
    Golem golem = Golem('Golem', 500, 5);
    Lucky lucky = Lucky('Lucky', 280, 10);
    Witcher witcher = Witcher('Witcher', 250, 0);
    Thor thor = Thor('Thor', 300, 20);
    Samurai samurai = Samurai('Samurai', 280, 15);
    List<Hero> heroes = [
      warrior1,
      doc,
      magic,
      berserk,
      warrior2,
      assistant,
      golem,
      lucky,
      witcher,
      thor,
      samurai 
    ];

    _showStatistics(boss, heroes);
    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static void _showStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber =========================');
    print(boss);
    for (Hero h in heroes) {
      print(h);
    }
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    if (boss.isStunned) {
      boss.isStunned = false; 
    } else {
      boss.attack(heroes);
    }
    for (Hero h in heroes) {
      if (h.isAlive()) {
        h.attack(boss);
        h.applySuperPower(boss, heroes);
      }
    }
    _showStatistics(boss, heroes);
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!!');
      return true;
    }
    bool allHeroesDead = true;
    for (Hero h in heroes) {
      if (h.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }
}
