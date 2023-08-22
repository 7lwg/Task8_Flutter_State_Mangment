part of 'task8_cubit.dart';

@immutable
sealed class Task8State {}

final class Task8Initial extends Task8State {}

//task1
final class ButtonColorChange extends Task8State {}

//task2
final class ShowPassword extends Task8State {}

//task3
final class RaidoButton extends Task8State {}

//task4
final class ShowText extends Task8State {}

final class ShowImage extends Task8State {}

final class ShowCircle extends Task8State {}

final class Reset extends Task8State {}
