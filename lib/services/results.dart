
import 'dart:convert';

import 'package:http/http.dart';

class Results{
    //All the needed things for what we'll display
    late String region;
    late String summonerID;
    late String encryptedSummonerID;
    late String tier;
    late String rank;
    late int lp;
    late int wins;
    late int losses;
    late int summonerLevel;
    late String apiKey = "RGAPI-2f98a2c4-b81f-4290-bfa4-6e848440ed61";

    //Constructor
    Results({required this.region,required this.summonerID,});

    Future<void> getInfo() async{
        print("got here");
        //submit first api request using region and summoner name
        Response response = await get(
            Uri.parse('https://$region.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerID?api_key=$apiKey'));

        //decode data into map
        Map data = jsonDecode(response.body);


        //save properties in strings
        summonerLevel = data['summonerLevel'];
        encryptedSummonerID = data['id'];

        //get ranked info
        Response rankedResponse = await get(
            Uri.parse('https://$region.api.riotgames.com/lol/league/v4/entries/by-summoner/$encryptedSummonerID?api_key=$apiKey'));

        //decode data into map
        List rankedData = jsonDecode(rankedResponse.body);

        //save properties in strings
        tier = rankedData[0]['tier'];
        rank = rankedData[0]['rank'];
        lp = (rankedData[0]['leaguePoints']);
        wins = (rankedData[0]['wins']);
        losses = (rankedData[0]['losses']);




    }
}



