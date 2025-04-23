String updateUrl(String originalUrl) {
  // Agar URL localhost bilan boshlasa, uni zoomedia.uz bilan almashtiradi
  if (originalUrl.startsWith('http://localhost:2091')) {
    print(originalUrl.replaceFirst(
        'http://localhost:2091', 'http://zoomedia.uz'));
    return originalUrl.replaceFirst(
        'http://localhost:2091', 'http://zoomedia.uz');
  } else {
    // Agar URL boshqa manzildan bo'lsa, o'zgartirmay qaytaradi
    return originalUrl;
  }
}
