import 'dart:math';

int randomId(int min, int max) {
  Random rnd = new Random();
//Getting range
  return min + rnd.nextInt(max - min);
}
