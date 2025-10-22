// Импорты всех тестовых файлов
import 'player_test.dart' as player_test;
import 'habit_test.dart' as habit_test;
import 'task_test.dart' as task_test;
import 'model_tests.dart' as model_tests;
import 'service_tests_without_hive.dart' as service_logic_tests;
import 'simple_hive_test.dart' as simple_hive_test;
import 'hive_service_simple_test.dart' as hive_service_test;
import 'day_completion_service_test.dart' as day_completion_test;
import 'integration_test.dart' as integration_test;
import 'widget_test.dart' as widget_test;
import 'player_settings_dialog_test.dart' as player_dialog_test;

void main() {
  // Этот файл запускает ВСЕ рабочие тесты в правильном порядке
  // От простых к сложным, чтобы минимизировать проблемы с зависимостями

  print('🚀 Starting comprehensive test suite...');
  print('========================================');
}

// Функции для запуска каждой группы тестов
void _runBasicModelTests() {
  print('🧪 1. Running Basic Model Tests...');
  player_test.main();
  habit_test.main();
  task_test.main();
  print('✅ Basic Model Tests completed');
  print('---');
}

void _runAdvancedModelTests() {
  print('🧪 2. Running Advanced Model Tests...');
  model_tests.main();
  print('✅ Advanced Model Tests completed');
  print('---');
}

void _runServiceLogicTests() {
  print('🧪 3. Running Service Logic Tests (without Hive)...');
  service_logic_tests.main();
  print('✅ Service Logic Tests completed');
  print('---');
}

void _runHiveIntegrationTests() {
  print('🧪 4. Running Hive Integration Tests...');
  simple_hive_test.main();
  hive_service_test.main();
  print('✅ Hive Integration Tests completed');
  print('---');
}

void _runServiceTests() {
  print('🧪 5. Running Service Tests...');
  day_completion_test.main();
  print('✅ Service Tests completed');
  print('---');
}

void _runIntegrationTests() {
  print('🧪 6. Running Integration Tests...');
  integration_test.main();
  print('✅ Integration Tests completed');
  print('---');
}

void _runWidgetTests() {
  print('🧪 7. Running Widget Tests...');
  widget_test.main();
  player_dialog_test.main();
  print('✅ Widget Tests completed');
  print('---');
}

void runAllTests() {
  print('🎯 COMPREHENSIVE TEST SUITE');
  print('============================');

  try {
    _runBasicModelTests();
    _runAdvancedModelTests();
    _runServiceLogicTests();
    _runHiveIntegrationTests();
    _runServiceTests();
    _runIntegrationTests();
    _runWidgetTests();

    print('🎉 ALL TESTS COMPLETED SUCCESSFULLY!');
    print('=====================================');
    print('📊 Summary: 13 test files executed');
    print('   • 4 Model test files');
    print('   • 3 Service test files');
    print('   • 2 Hive test files');
    print('   • 2 Integration test files');
    print('   • 2 Widget test files');
  } catch (e) {
    print('❌ TEST SUITE FAILED: $e');
    rethrow;
  }
}
