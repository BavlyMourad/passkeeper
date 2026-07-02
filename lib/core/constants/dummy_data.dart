import 'package:passkeeper/features/passwords/domain/models/password.dart';

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}

List<Category> dummyCategories = [
  Category(id: '1', name: 'Bank'),
  Category(id: '2', name: 'Social Media'),
  Category(id: '3', name: 'Games'),
  Category(id: '4', name: 'Apps'),
  Category(id: '5', name: 'Work'),
];

List<Password> dummyPasswords = [
  Password(
    id: 'pwd_001',
    title: 'Google',
    username: 'john.doe@gmail.com',
    encryptedPassword: 'U2FsdGVkX1+abc123encryptedData',
    url: 'https://accounts.google.com',
    categoryIds: ['1', '2', '5'], // Bank, Social Media, Work
    isFavourite: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    iv: 'a1b2c3d4e5f6g7h8',
  ),
  Password(
    id: 'pwd_002',
    title: 'Facebook',
    username: 'john.doe',
    encryptedPassword: 'U2FsdGVkX1+fb456encryptedData',
    url: 'https://facebook.com',
    categoryIds: ['2'], // Social Media
    isFavourite: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    iv: 'h8g7f6e5d4c3b2a1',
  ),
  Password(
    id: 'pwd_003',
    title: 'Steam',
    username: 'john_gamer',
    encryptedPassword: 'U2FsdGVkX1+steam789encryptedData',
    url: 'https://store.steampowered.com',
    categoryIds: ['3'], // Games
    isFavourite: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    iv: '1a2b3c4d5e6f7g8h',
  ),
  Password(
    id: 'pwd_004',
    title: 'Bank Account',
    username: 'john.doe',
    encryptedPassword: 'U2FsdGVkX1+bank987encryptedData',
    url: 'https://onlinebank.example.com',
    categoryIds: ['1'], // Bank
    isFavourite: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    iv: '8h7g6f5e4d3c2b1a',
  ),
];
