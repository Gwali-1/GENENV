from setuptools import setup,find_packages


setup(
    name='genenv',
    version='1.0.0',
    description='command line utility tool that allows you to create python virtual environements with already installed dependencies you want easily',
    long_description=open('README-copy.md').read(),
    long_description_content_type='text/markdown',
    packages=find_packages(),
    py_modules=['genenv'],
    author='Matthew Gwalisam',
    author_email='gwalisam37@email.com',
    url='https://github.com/Gwali-1/GENENV.git',
    include_package_data=True,
    license='MIT',
      python_requires='>=3.7',
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.11',
    ],
    install_requires=["click"],
    entry_points='''
        [console_scripts]
        genenv=genenv:cli
    ''',
)