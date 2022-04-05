const getJobs = r'''
  query GetJobs() {
    jobs {
      id,
      title,
      locationNames,
      isFeatured,
      description,
			tags{
        id
				name
        slug
			}
    }
  }
''';
